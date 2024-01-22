import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateBlocDto } from './dto/create-blocs.dto';
import { UpdateBlocDto } from './dto/update-blocs.dto';
import { Bloc } from './entities/blocs.entity';

@Injectable()
export class BlocService {
    /**
     * Here, we have used data mapper approch for this tutorial that is why we
     * injecting repository here. Another approch can be Active records.
     */
    constructor(
        @InjectRepository(Bloc) private readonly blocRepository: Repository<Bloc>,
    ) { }

    /**
     * this is function is used to create Bloc in Bloc Entity.
     * @param createBlocDto this will type of createBlocDto in which
     * we have defined what are the keys we are expecting from body
     * @returns promise of bloc
     */
    createBloc(createBlocDto: CreateBlocDto): Promise<Bloc> {
        const bloc: Bloc = new Bloc();
        return this.blocRepository.save(bloc);
    }

    /**
     * this function is used to get all the bloc's list
     * @returns promise of array of blocs
     */
    findAllBloc(): Promise<Bloc[]> {
        let sql = `SELECT * FROM bloc`;
        return this.blocRepository.query(sql)
    }

    /**
     * this function used to get data of use whose id is passed in parameter
     * @param id is type of number, which represent the id of bloc.
     * @returns promise of bloc
     */
    viewBloc(uuid: string): Promise<Bloc> {
        return this.blocRepository.findOneBy({ uuid });
    }

    /**
     * this function is used to updated specific bloc whose id is passed in
     * parameter along with passed updated data
     * @param uuid is type of number, which represent the id of bloc.
     * @param updateBlocDto this is partial type of createBlocDto.
     * @returns promise of udpate bloc
     */
    updateBloc(uuid: string, updateBlocDto: UpdateBlocDto): Promise<Bloc> {
        const bloc: Bloc = new Bloc();
        bloc.uuid = uuid;
        return this.blocRepository.save(bloc);
    }

    /**
     * this function is used to remove or delete bloc from database.
     * @param uuid is the type of number, which represent id of bloc
     * @returns nuber of rows deleted or affected
     */
    removeBloc(uuid: string): Promise<{ affected?: number }> {
        return this.blocRepository.delete(uuid);
    }
}