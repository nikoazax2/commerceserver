import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateContenuDto } from './dto/create-contenu.dto';
import { UpdateContenuDto } from './dto/update-contenu.dto';
import { Contenu } from './entities/contenu.entity';

@Injectable()
export class ContenuService {

    constructor(
        @InjectRepository(Contenu) private readonly contenuRepository: Repository<Contenu>,
    ) { }

    createContenu(createContenuDto: CreateContenuDto): Promise<Contenu> {
        const contenu: Contenu = new Contenu();
        contenu.name = createContenuDto.name;
        contenu.description = createContenuDto.description;
        contenu.contenu = createContenuDto.contenu as unknown as JSON;
        contenu.page = createContenuDto.page;
        contenu.order = createContenuDto.order;
        contenu.valeur = createContenuDto.valeur;
        contenu.photo = createContenuDto.photo;
        contenu.image = createContenuDto.image;
        contenu.type = createContenuDto.type;
        contenu.removable = createContenuDto.removable;
        return this.contenuRepository.save(contenu);
    }

    /**
     * this function is used to get all the contenu's list
     * @returns promise of array of contenus
     */
    findAllContenu(): Promise<Contenu[]> {
        let sql = `SELECT * FROM contenu ORDER BY "order" ASC`;
        return this.contenuRepository.query(sql)
    }

    /**
     * this function used to get data of use whose id is passed in parameter
     * @param id is type of number, which represent the id of contenu.
     * @returns promise of contenu
     */
    viewContenu(uuid: string): Promise<Contenu> {
        return this.contenuRepository.findOneBy({ uuid });
    }

    /**
     * this function is used to updated specific contenu whose id is passed in
     * parameter along with passed updated data
     * @param uuid is type of number, which represent the id of contenu.
     * @param updateContenuDto this is partial type of createContenuDto.
     * @returns promise of udpate contenu
     */
    updateContenu(uuid: string, updateContenuDto: UpdateContenuDto): Promise<Contenu> {
        const contenu: Contenu = new Contenu();
        contenu.uuid = uuid;
        contenu.name = updateContenuDto.name;
        contenu.description = updateContenuDto.description;
        contenu.contenu = updateContenuDto.contenu as unknown as JSON;
        contenu.page = updateContenuDto.page;
        contenu.order = updateContenuDto.order;
        contenu.valeur = updateContenuDto.valeur;
        contenu.photo = updateContenuDto.photo;
        contenu.image = updateContenuDto.image;
        contenu.type = updateContenuDto.type;
        contenu.removable = updateContenuDto.removable;
        return this.contenuRepository.save(contenu);
    }

    /**
     * this function is used to remove or delete contenu from database.
     * @param uuid is the type of number, which represent id of contenu
     * @returns nuber of rows deleted or affected
     */
    removeContenu(uuid: string): Promise<{ affected?: number }> {
        return this.contenuRepository.delete(uuid);
    }
}