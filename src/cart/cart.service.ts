import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCartDto } from './dto/create-cart.dto';
import { UpdateCartDto } from './dto/update-cart.dto';
import { Cart } from './entities/cart.entity'; 

@Injectable()
export class Cartervice {
    /**
     * Here, we have used data mapper approch for this tutorial that is why we
     * injecting repository here. Another approch can be Active records.
     */
    constructor(
        @InjectRepository(Cart) private readonly cart: Repository<Cart>,
        @InjectRepository(Cart) private readonly cartRepository: Repository<Cart> 
    ) { }


    async findOne(uuid: string): Promise<Cart | undefined> {
        return this.cart.findOne({ where: { uuid: uuid } });
    }
    /**
     * this is function is used to create Cart in Cart Entity.
     * @param createCartDto this will type of createCartDto in which
     * we have defined what are the keys we are expecting from body
     * @returns promise of cart
     */
    async createCart(createCartDto: CreateCartDto): Promise<Cart> {
        const cart: Cart = new Cart();
        cart.user = createCartDto.user;
        cart.product = createCartDto.product as unknown as JSON;
        cart.quantity = createCartDto.quantity;
        cart.details = createCartDto.details;
        return this.cartRepository.save(cart);
    }

    /**
     * this function is used to get all the cart's list
     * @returns promise of array of cart
     */
    findAllCart(): Promise<Cart[]> {
        return this.cartRepository.find();
    }

    /**
     * this function used to get data of use whose id is passed in parameter
     * @param id is type of number, which represent the id of cart.
     * @returns promise of cart
     */
    viewCart(uuid: string): Promise<Cart> {
        return this.cartRepository.findOneBy({ uuid });
    }


    /**
     * this function is used to updated specific cart whose id is passed in
     * parameter along with passed updated data
     * @param uuid is type of number, which represent the id of cart.
     * @param updateCartDto this is partial type of createCartDto.
     * @returns promise of udpate cart
     */
    updateCart(uuid: string, updateCartDto: UpdateCartDto): Promise<Cart> {
        const cart: Cart = new Cart();
        cart.uuid = uuid;
        cart.quantity = updateCartDto.quantity;
        cart.product = updateCartDto.product as unknown as JSON;
        cart.user = updateCartDto.user;
        cart.details = updateCartDto.details;
        return this.cartRepository.save(cart);
    }

    /**
     * this function is used to remove or delete cart from database.
     * @param uuid is the type of number, which represent id of cart
     * @returns nuber of rows deleted or affected
     */
    removeCart(uuid: string): Promise<{ affected?: number }> {
        return this.cartRepository.delete(uuid);
    }
}