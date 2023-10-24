import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { User } from './entities/user.entity';

@Injectable()
export class UsersService {
    /**
     * Here, we have used data mapper approch for this tutorial that is why we
     * injecting repository here. Another approch can be Active records.
     */
    constructor(
        @InjectRepository(User) private users: Repository<User>,
        @InjectRepository(User) private readonly userRepository: Repository<User>,
    ) { }


    async findOne(username: string): Promise<User | undefined> {
        return this.users.findOne({ where: { username: username } });
    } 

    /**
     * this is function is used to create User in User Entity.
     * @param createUserDto this will type of createUserDto in which
     * we have defined what are the keys we are expecting from body
     * @returns promise of user
     */
    createUser(createUserDto: CreateUserDto): Promise<User> {
        const user: User = new User(); 
        user.username = createUserDto.username;
        user.adress = createUserDto.adress;
        user.email = createUserDto.email;
        user.password = createUserDto.password;
        return this.userRepository.save(user);
    }

    /**
     * this function is used to get all the user's list
     * @returns promise of array of users
     */
    findAllUser(): Promise<User[]> {
        return this.userRepository.find();
    }

    /**
     * this function used to get data of use whose id is passed in parameter
     * @param id is type of number, which represent the id of user.
     * @returns promise of user
     */
    viewUser(uuid: string): Promise<User> {
        return this.userRepository.findOneBy({ uuid });
    }


    /**
     * this function is used to updated specific user whose id is passed in
     * parameter along with passed updated data
     * @param uuid is type of number, which represent the id of user.
     * @param updateUserDto this is partial type of createUserDto.
     * @returns promise of udpate user
     */
    updateUser(uuid: string, updateUserDto: UpdateUserDto): Promise<User> {
        const user: User = new User();
        user.uuid = uuid; 
        user.username = updateUserDto.username;
        user.adress = updateUserDto.adress;
        user.email = updateUserDto.email;
        user.password = updateUserDto.password;
        return this.userRepository.save(user);
    }

    /**
     * this function is used to remove or delete user from database.
     * @param uuid is the type of number, which represent id of user
     * @returns nuber of rows deleted or affected
     */
    removeUser(uuid: string): Promise<{ affected?: number }> {
        return this.userRepository.delete(uuid);
    }
}