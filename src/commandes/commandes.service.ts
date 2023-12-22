import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCommandeDto } from './dto/create-commande.dto';
import { UpdateCommandeDto } from './dto/update-commande.dto';
import { Commande } from './entities/commandes.entity';

@Injectable()
export class CommandeService {
    handlePaymentSuccess(paymentIntent: any) {
        throw new Error('Method not implemented.');
    }
    /**
     * Here, we have used data mapper approch for this tutorial that is why we
     * injecting repository here. Another approch can be Active records.
     */
    constructor(
        @InjectRepository(Commande) private readonly commandeRepository: Repository<Commande>,
    ) { }


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