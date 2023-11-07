import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
  } from '@nestjs/common';
  import { CategorieService } from './categories.service';
  import { CreateCategorieDto } from './dto/create-categories.dto';
  import { UpdateCategorieDto } from './dto/update-categories.dto';
  
  /**
   * whatever the string pass in controller decorator it will be appended to
   * API URL. to call any API from this controller you need to add prefix which is
   * passed in controller decorator.
   * in our case our base URL is http://localhost:3000/Categorie
   */
  @Controller('Categorie')
  export class CategorieController {
    constructor(private readonly CategorieService: CategorieService) {}
  
    /**
     * Post decorator represents method of request as we have used post decorator the method
     * of this API will be post.
     * so the API URL to create Categorie will be
     * POST http://localhost:3000/Categorie
     */
    @Post()
    create(@Body() createCategorieDto: CreateCategorieDto) {
      return this.CategorieService.createCategorie(createCategorieDto);
    }
  
    /**
     * we have used get decorator to get all the Categorie's list
     * so the API URL will be
     * GET http://localhost:3000/Categorie
     */
    @Get()
    findAll() {
      return this.CategorieService.findAllCategorie();
    }
  
    /**
     * we have used get decorator with id param to get id from request
     * so the API URL will be
     * GET http://localhost:3000/Categorie/:id
     */
    @Get(':uuid')
    findOne(@Param('uuid') uuid: string) {
      return this.CategorieService.viewCategorie(uuid);
    }
  
    /**
     * we have used patch decorator with id param to get id from request
     * so the API URL will be
     * PATCH http://localhost:3000/Categorie/:id
     */
    @Patch(':uuid')
    update(@Param('uuid') uuid: string, @Body() updateCategorieDto: UpdateCategorieDto) {
      return this.CategorieService.updateCategorie(uuid, updateCategorieDto);
    }
  
    /**
     * we have used Delete decorator with id param to get id from request
     * so the API URL will be
     * DELETE http://localhost:3000/Categorie/:id
     */
    @Delete(':uuid')
    remove(@Param('uuid') uuid: string) {
      return this.CategorieService.removeCategorie(uuid);
    }
  }