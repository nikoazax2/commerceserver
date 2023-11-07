import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateProductDto } from './dto/create-products.dto';
import { UpdateProductDto } from './dto/update-products.dto';
import { Product } from './entities/products.entity';
import { Categorie } from './entities/products.entity';
@Injectable()
export class ProductService {
    /**
     * Here, we have used data mapper approch for this tutorial that is why we
     * injecting repository here. Another approch can be Active records.
     */
    constructor( 
        @InjectRepository(Product) private readonly productRepository: Repository<Product>,
    ) { }


    async findOneUUID(uuid: string): Promise<Product | undefined> {
        return this.productRepository.findOne({ where: { uuid: uuid } });
    }

    /**
     * this is function is used to create Product in Product Entity.
     * @param createProductDto this will type of createProductDto in which
     * we have defined what are the keys we are expecting from body
     * @returns promise of product
     */
    createProduct(createProductDto: CreateProductDto): Promise<Product> {
        const product: Product = new Product();
        product.name = createProductDto.name;
        product.prix = createProductDto.prix;
        product.description = createProductDto.description;
        product.image = createProductDto.image;
        return this.productRepository.save(product);
    }

    /**
     * this function is used to get all the product's list
     * @returns promise of array of products
     */
    findAllProduct(): Promise<Product[]> {
        return this.productRepository.createQueryBuilder('product')
            .leftJoinAndSelect('product.categorie', 'categorie')
            .getMany();
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
    updateProduct(uuid: string, updateProductDto: UpdateProductDto): Promise<Product> {
        const product: Product = new Product();
        product.uuid = uuid;
        product.name = updateProductDto.name;
        product.prix = updateProductDto.prix;
        product.description = updateProductDto.description;
        product.image = updateProductDto.image;
        return this.productRepository.save(product);
    }

    /**
     * this function is used to remove or delete product from database.
     * @param uuid is the type of number, which represent id of product
     * @returns nuber of rows deleted or affected
     */
    removeProduct(uuid: string): Promise<{ affected?: number }> {
        return this.productRepository.delete(uuid);
    }
}