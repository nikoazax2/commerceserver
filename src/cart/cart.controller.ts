import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
} from '@nestjs/common';
import { Cartervice } from './cart.service';
import { CreateCartDto } from './dto/create-cart.dto';
import { UpdateCartDto } from './dto/update-cart.dto';

/**
 * whatever the string pass in controller decorator it will be appended to
 * API URL. to call any API from this controller you need to add prefix which is
 * passed in controller decorator.
 * in our case our base URL is http://localhost:3000/cart
 */
@Controller('cart')
export class CartController {
    constructor(private readonly Cartervice: Cartervice) { }

    /**
     * Post decorator represents method of request as we have used post decorator the method
     * of this API will be post.
     * so the API URL to create Cart will be
     * POST http://localhost:3000/cart
     */
    @Post()
    create(@Body() createCartDto: CreateCartDto ) {
        return this.Cartervice.createCart(createCartDto );
    }

    /**
     * we have used get decorator to get all the cart's list
     * so the API URL will be
     * GET http://localhost:3000/cart
     */
    @Get()
    findAll() {
        return this.Cartervice.findAllCart();
    }

    /**
     * we have used get decorator with id param to get id from request
     * so the API URL will be
     * GET http://localhost:3000/cart/:id
     */
    @Get(':uuid')
    findOne(@Param('uuid') uuid: string) {
        return this.Cartervice.viewCart(uuid);
    }

    /**
     * we have used patch decorator with id param to get id from request
     * so the API URL will be
     * PATCH http://localhost:3000/cart/:id
     */
    @Patch(':uuid')
    update(@Param('uuid') uuid: string, @Body() updateCartDto: UpdateCartDto) {
        return this.Cartervice.updateCart(uuid, updateCartDto);
    }

    /**
     * we have used Delete decorator with id param to get id from request
     * so the API URL will be
     * DELETE http://localhost:3000/cart/:id
     */
    @Delete(':uuid')
    remove(@Param('uuid') uuid: string) {
        return this.Cartervice.removeCart(uuid);
    }
}