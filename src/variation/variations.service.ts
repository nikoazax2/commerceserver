import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateVariationDto } from './dto/create-variation.dto';
import { UpdateVariationDto } from './dto/update-variation.dto';
import { Variation } from './entities/variations.entity';

@Injectable()
export class VariationService {
    /**
     * Here, we have used data mapper approch for this tutorial that is why we
     * injecting repository here. Another approch can be Active records.
     */
    constructor(
        @InjectRepository(Variation) private readonly variationRepository: Repository<Variation>,
    ) { }


    async findOneUUID(uuid: string): Promise<Variation | undefined> {
        return this.variationRepository.findOne({ where: { uuid: uuid } });
    }

    /**
     * this is function is used to create Variation in Variation Entity.
     * @param createVariationDto this will type of createVariationDto in which
     * we have defined what are the keys we are expecting from body
     * @returns promise of variation
     */
    createVariation(createVariationDto: CreateVariationDto): Promise<Variation> {
        const variation: Variation = new Variation();
        variation.name = createVariationDto.name;
        variation.stock = createVariationDto.stock;
        variation.productuuid = createVariationDto.productuuid;
        variation.order = createVariationDto.order;  
        return this.variationRepository.save(variation);
    }

    /**
     * this function used to get data of use whose id is passed in parameter
     * @param id is type of number, which represent the id of variation.
     * @returns promise of variation
     */
    viewVariation(uuid: string): Promise<Variation> {
        return this.variationRepository.findOneBy({ uuid });
    }

    /**
     * this function is used to updated specific variation whose id is passed in
     * parameter along with passed updated data
     * @param uuid is type of number, which represent the id of variation.
     * @param updateVariationDto this is partial type of createVariationDto.
     * @returns promise of udpate variation
     */
    updateVariation(uuid: string, updateVariationDto: UpdateVariationDto): Promise<Variation> {
        const variation: Variation = new Variation();
        variation.uuid = uuid;
        variation.name = updateVariationDto.name;
        variation.stock = updateVariationDto.stock;
        variation.productuuid = updateVariationDto.productuuid;
        variation.order = updateVariationDto.order;
        return this.variationRepository.save(variation);
    }

    /**
     * this function is used to remove or delete variation from database.
     * @param uuid is the type of number, which represent id of variation
     * @returns nuber of rows deleted or affected
     */
    removeVariation(uuid: string): Promise<{ affected?: number }> {
        return this.variationRepository.delete(uuid);
    }
}