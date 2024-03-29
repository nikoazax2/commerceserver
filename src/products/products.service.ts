import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateProductDto } from './dto/create-products.dto';
import { UpdateProductDto } from './dto/update-products.dto';
import { Product } from './entities/products.entity';
import { Categorie } from './entities/products.entity';
import Stripe from 'stripe';
import * as fs from 'fs';

@Injectable()
export class ProductService {
    private stripe: Stripe;
    constructor(
        @InjectRepository(Product) private readonly productRepository: Repository<Product>,
    ) {
        this.stripe = new Stripe('sk_test_51NboKUBTmmLQabfnkwiJPwHERe8S1ThthDlWT6iWewGN4BBqPfcGIQmlv8Q81jEC9SGtd44dpaE7JLBfK4axZpqP00LYPHYiP5', {
            apiVersion: '2022-11-15',
        });
    }


    async findOneUUID(uuid: string): Promise<Product | undefined> {
        return this.productRepository.findOne({ where: { uuid: uuid } });
    }

    /**
     * this is function is used to create Product in Product Entity.
     * @param createProductDto this will type of createProductDto in which
     * we have defined what are the keys we are expecting from body
     * @returns promise of product
     */
    async createProduct(createProductDto: CreateProductDto): Promise<Product> {
        const product: Product = new Product();
        product.name = createProductDto.name;
        product.prix = createProductDto.prix;
        product.description = createProductDto.description;
        product.image = createProductDto.image;
        product.idapistripe = createProductDto.idapistripe;
        product.categorieuuid = createProductDto.categorieuuid;
        product.ancienprixpromo = createProductDto.ancienprixpromo;
        let productCree = await this.productRepository.save(product);
        //get the uuid
        let uuid = productCree.uuid;
        const productStripe = await this.stripe.products.create({
            name: createProductDto.name || "Sans nom",
            default_price_data: {
                currency: 'eur',
                unit_amount: createProductDto.prix * 100 || 0,
            },
            id: uuid
        });
        product.idapistripe = productStripe.default_price.toString();
        await this.productRepository.save(product);
        return product
    }

    /**
     * this function is used to get all the product's list
     * @returns promise of array of products
     */
    async findAllProduct(): Promise<Product[]> {
        const entityManager = this.productRepository.manager;
        const result = await entityManager.query(`
        SELECT p.uuid, p.prix, p.name, p.description, p.image, p.idapistripe, p.ancienprixpromo,
        json_build_object('uuid', c.uuid, 'name', c.name) as categorie, 
        (
            SELECT json_agg(v)
            FROM (
                SELECT * FROM variation
                WHERE productuuid = p.uuid
                ORDER BY "order"
            ) v
        ) as variations
        FROM product p
        JOIN categorie c ON p.categorieuuid = c.uuid  
        `);
        return result;
    }
    /**
     * this function used to get data of use whose id is passed in parameter
     * @param id is type of number, which represent the id of product.
     * @returns promise of product
     */
    viewProduct(uuid: string): Promise<Product> {
        return this.productRepository.findOneBy({ uuid });
    }

    /**
     * this function is used to updated specific product whose id is passed in
     * parameter along with passed updated data
     * @param uuid is type of number, which represent the id of product.
     * @param updateProductDto this is partial type of createProductDto.
     * @returns promise of udpate product
     */
    async updateProduct(uuid: string, updateProductDto: UpdateProductDto): Promise<Product> {
        const product: Product = new Product();
        product.uuid = uuid;
        product.name = updateProductDto.name;
        product.prix = updateProductDto.prix;
        product.description = updateProductDto.description;
        product.idapistripe = updateProductDto.idapistripe;
        product.image = updateProductDto.image;
        product.categorieuuid = updateProductDto.categorieuuid;
        product.ancienprixpromo = updateProductDto.ancienprixpromo;
         
        let base64Image = null;
        // if (product.image[0]) {
        //     const file = fs.readFileSync(`./uploadsProduct/${product.image[0]}`);
        //     base64Image = file.toString();
        // }
        const productStripe = await this.stripe.products.update(uuid, {
            name: updateProductDto.name || "Sans nom" 
        })

        const newPrice = await this.stripe.prices.create({
            unit_amount: product.prix * 100 || 0,
            currency: 'eur',
            product: product.uuid
        });
        product.idapistripe = newPrice.id

        return this.productRepository.save(product);
    }

    /**
     * this function is used to remove or delete product from database.
     * @param uuid is the type of number, which represent id of product
     * @returns nuber of rows deleted or affected
     */
    async removeProduct(uuid: string): Promise<{ affected?: number }> {
        this.stripe.products.update(uuid, {
            active: false
        })
        return this.productRepository.delete(uuid);
    }
}