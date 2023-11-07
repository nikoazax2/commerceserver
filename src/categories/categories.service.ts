import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCategorieDto } from './dto/create-categories.dto';
import { UpdateCategorieDto } from './dto/update-categories.dto';
import { Categorie } from './entities/categories.entity';

@Injectable()
export class CategorieService {
    /**
     * Here, we have used data mapper approch for this tutorial that is why we
     * injecting repository here. Another approch can be Active records.
     */
    constructor(
        @InjectRepository(Categorie) private readonly categorieRepository: Repository<Categorie>,
    ) { }

    /**
     * this is function is used to create Categorie in Categorie Entity.
     * @param createCategorieDto this will type of createCategorieDto in which
     * we have defined what are the keys we are expecting from body
     * @returns promise of categorie
     */
    createCategorie(createCategorieDto: CreateCategorieDto): Promise<Categorie> {
        const categorie: Categorie = new Categorie();
        categorie.name = createCategorieDto.name; 
        return this.categorieRepository.save(categorie);
    }

    /**
     * this function is used to get all the categorie's list
     * @returns promise of array of categories
     */
    findAllCategorie(): Promise<Categorie[]> {
        return this.categorieRepository.find();
    }

    /**
     * this function used to get data of use whose id is passed in parameter
     * @param id is type of number, which represent the id of categorie.
     * @returns promise of categorie
     */
    viewCategorie(uuid: string): Promise<Categorie> {
        return this.categorieRepository.findOneBy({ uuid });
    }

    /**
     * this function is used to updated specific categorie whose id is passed in
     * parameter along with passed updated data
     * @param uuid is type of number, which represent the id of categorie.
     * @param updateCategorieDto this is partial type of createCategorieDto.
     * @returns promise of udpate categorie
     */
    updateCategorie(uuid: string, updateCategorieDto: UpdateCategorieDto): Promise<Categorie> {
        const categorie: Categorie = new Categorie();
        categorie.uuid = uuid;
        categorie.name = updateCategorieDto.name; 
        return this.categorieRepository.save(categorie);
    }

    /**
     * this function is used to remove or delete categorie from database.
     * @param uuid is the type of number, which represent id of categorie
     * @returns nuber of rows deleted or affected
     */
    removeCategorie(uuid: string): Promise<{ affected?: number }> {
        return this.categorieRepository.delete(uuid);
    }
}