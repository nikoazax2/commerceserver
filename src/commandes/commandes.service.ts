import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCommandeDto } from './dto/create-commande.dto';
import { UpdateCommandeDto } from './dto/update-commande.dto';
import { Commande } from './entities/commandes.entity';
import Stripe from 'stripe';

@Injectable()
export class CommandeService {

    private stripe: Stripe;
    constructor(
        @InjectRepository(Commande)
        private commandeRepository: Repository<Commande>,
    ) {
        this.stripe = new Stripe('sk_test_51NboKUBTmmLQabfnkwiJPwHERe8S1ThthDlWT6iWewGN4BBqPfcGIQmlv8Q81jEC9SGtd44dpaE7JLBfK4axZpqP00LYPHYiP5', {
            apiVersion: '2022-11-15',
        });
    }

    getCommandes(user: any) {
        if (user.role === 1) {
            return this.commandeRepository.find()
        } else {
            return this.commandeRepository.find({ where: { useruuid: user.uuid } });
        }
    }


    /**
     * Vérifie que le paiement a bien été effectué avec stripe
     * si oui, crée la commande
     */
    async confirmationPaiement(body: any, user: any) {
        const session = await this.stripe.checkout.sessions.retrieve(body.CHECKOUT_SESSION_ID);
        if (typeof session.payment_intent === 'string') {
            const paymentIntent = await this.stripe.paymentIntents.retrieve(session.payment_intent);

            //test if stripeid does not exist in database
            const commande = await this.commandeRepository.findOne({ where: { stripeid: paymentIntent.id } });
            if (commande) {
                return 'ERROR';
            }

            if (paymentIntent.status === 'succeeded') {
                const commande: Commande = new Commande();
                commande.date = new Date();
                commande.stripeid = paymentIntent.id;
                commande.useruuid = user.uuid;
                commande.products = body.products;
                commande.shippingAddress = paymentIntent.shipping as JSON;
                commande.etat = 1; // 1 payé
                this.commandeRepository.save(commande);
                return 'OK'
            }
        } else {
            console.error('PaymentIntent ID is not a string');
        }
        return 'ERROR';


    }


    async findOneUUID(uuid: string): Promise<Commande | undefined> {
        return this.commandeRepository.findOne({ where: { uuid: uuid } });
    }

    /**
     * this is function is used to create Commande in Commande Entity.
     * @param createCommandeDto this will type of createCommandeDto in which
     * we have defined what are the keys we are expecting from body
     * @returns promise of commande
     */
    createCommande(createCommandeDto: CreateCommandeDto): Promise<Commande> {
        const commande: Commande = new Commande();
        commande.date = createCommandeDto.date;
        commande.useruuid = createCommandeDto.useruuid;
        commande.stripeid = createCommandeDto.stripeid;
        commande.products = createCommandeDto.products;
        commande.etat = createCommandeDto.etat;
        return this.commandeRepository.save(commande);
    }

    /**
     * this function used to get data of use whose id is passed in parameter
     * @param id is type of number, which represent the id of commande.
     * @returns promise of commande
     */
    viewCommande(uuid: string): Promise<Commande> {
        return this.commandeRepository.findOneBy({ uuid });
    }

    /**
     * this function is used to updated specific commande whose id is passed in
     * parameter along with passed updated data
     * @param uuid is type of number, which represent the id of commande.
     * @param updateCommandeDto this is partial type of createCommandeDto.
     * @returns promise of udpate commande
     */
    updateCommande(uuid: string, updateCommandeDto: UpdateCommandeDto): Promise<Commande> {
        const commande: Commande = new Commande();
        commande.uuid = uuid;
        commande.date = updateCommandeDto.date;
        commande.useruuid = updateCommandeDto.useruuid;
        commande.stripeid = updateCommandeDto.stripeid;
        commande.products = updateCommandeDto.products;
        commande.etat = updateCommandeDto.etat;
        return this.commandeRepository.save(commande);
    }

    /**
     * this function is used to remove or delete commande from database.
     * @param uuid is the type of number, which represent id of commande
     * @returns nuber of rows deleted or affected
     */
    removeCommande(uuid: string): Promise<{ affected?: number }> {
        return this.commandeRepository.delete(uuid);
    }
}