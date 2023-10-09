import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
  } from '@nestjs/common';
  import { ProductService } from './products.service';
  import { CreateProductDto } from './dto/create-products.dto';
  import { UpdateProductDto } from './dto/update-products.dto';
  
  /**
   * whatever the string pass in controller decorator it will be appended to
   * API URL. to call any API from this controller you need to add prefix which is
   * passed in controller decorator.
   * in our case our base URL is http://localhost:3000/Product
   */
  @Controller('Product')
  export class ProductController {
    constructor(private readonly ProductService: ProductService) {}
  
    /**
     * Post decorator represents method of request as we have used post decorator the method
     * of this API will be post.
     * so the API URL to create Product will be
     * POST http://localhost:3000/Product
     */
    @Post()
    create(@Body() createProductDto: CreateProductDto) {
      return this.ProductService.createProduct(createProductDto);
    }
  
    /**
     * we have used get decorator to get all the Product's list
     * so the API URL will be
     * GET http://localhost:3000/Product
     */
    @Get()
    findAll() {
      return this.ProductService.findAllProduct();
    }
  
    /**
     * we have used get decorator with id param to get id from request
     * so the API URL will be
     * GET http://localhost:3000/Product/:id
     */
    @Get(':uuid')
    findOne(@Param('uuid') uuid: string) {
      return this.ProductService.viewProduct(uuid);
    }
  
    /**
     * we have used patch decorator with id param to get id from request
     * so the API URL will be
     * PATCH http://localhost:3000/Product/:id
     */
    @Patch(':uuid')
    update(@Param('uuid') uuid: string, @Body() updateProductDto: UpdateProductDto) {
      return this.ProductService.updateProduct(uuid, updateProductDto);
    }
  
    /**
     * we have used Delete decorator with id param to get id from request
     * so the API URL will be
     * DELETE http://localhost:3000/Product/:id
     */
    @Delete(':uuid')
    remove(@Param('uuid') uuid: string) {
      return this.ProductService.removeProduct(uuid);
    }
  }