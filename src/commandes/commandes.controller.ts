import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
} from '@nestjs/common';
import { CommandeService } from './commandes.service';
import { CreateCommandeDto } from './dto/create-commande.dto';
import { UpdateCommandeDto } from './dto/update-commande.dto';
import { JwtService } from '@nestjs/jwt';
import { Headers } from '@nestjs/common';

/**
 * whatever the string pass in controller decorator it will be appended to
 * API URL. to call any API from this controller you need to add prefix which is
 * passed in controller decorator.
 * in our case our base URL is http://localhost:3000/Commande
 */
@Controller('Commande')
export class CommandeController {
    constructor(private readonly CommandeService: CommandeService, private jwtService: JwtService) { }


    @Post('confirmation')
    async confirmationPaiement(@Body() body, @Headers('Authorization') token: string) {
        let user = this.jwtService.decode(token.replace('Bearer ', ''))
        return this.CommandeService.confirmationPaiement(body,user);
    }


    /**
     * Post decorator represents method of request as we have used post decorator the method
     * of this API will be post.
     * so the API URL to create Commande will be
     * POST http://localhost:3000/Commande
     */
    @Post()
    create(@Body() createCommandeDto: CreateCommandeDto) {
        return this.CommandeService.createCommande(createCommandeDto);
    }

    /**
     * Crée une commande et l'envoie à Stripe pour paiement
     */
    @Post('paiement')
    createAndPay(@Body() createCommandeDto: CreateCommandeDto) {
        return this.CommandeService.createCommande(createCommandeDto);
    }

    /**
     * we have used get decorator with id param to get id from request
     * so the API URL will be
     * GET http://localhost:3000/Commande/:id
     */
    @Get(':uuid')
    findOne(@Param('uuid') uuid: string) {
        return this.CommandeService.viewCommande(uuid);
    }

    @Get()
    findAll( @Headers('Authorization') token: string) {
        let user = this.jwtService.decode(token.replace('Bearer ', ''))
        return this.CommandeService.getCommandes(user);
    }

    /**
     * we have used patch decorator with id param to get id from request
     * so the API URL will be
     * PATCH http://localhost:3000/Commande/:id
     */
    @Patch(':uuid')
    update(@Param('uuid') uuid: string, @Body() updateCommandeDto: UpdateCommandeDto) {
        return this.CommandeService.updateCommande(uuid, updateCommandeDto);
    }

    /**
     * we have used Delete decorator with id param to get id from request
     * so the API URL will be
     * DELETE http://localhost:3000/Commande/:id
     */
    @Delete(':uuid')
    remove(@Param('uuid') uuid: string) {
        return this.CommandeService.removeCommande(uuid);
    }
}