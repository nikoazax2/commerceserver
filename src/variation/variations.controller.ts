import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
  } from '@nestjs/common';
  import { VariationService } from './variations.service';
  import { CreateVariationDto } from './dto/create-variation.dto';
  import { UpdateVariationDto } from './dto/update-variation.dto';
  
  /**
   * whatever the string pass in controller decorator it will be appended to
   * API URL. to call any API from this controller you need to add prefix which is
   * passed in controller decorator.
   * in our case our base URL is http://localhost:3000/Variation
   */
  @Controller('Variation')
  export class VariationController {
    constructor(private readonly VariationService: VariationService) {}
  
    /**
     * Post decorator represents method of request as we have used post decorator the method
     * of this API will be post.
     * so the API URL to create Variation will be
     * POST http://localhost:3000/Variation
     */
    @Post()
    create(@Body() createVariationDto: CreateVariationDto) {
      return this.VariationService.createVariation(createVariationDto);
    } 
  
    /**
     * we have used get decorator with id param to get id from request
     * so the API URL will be
     * GET http://localhost:3000/Variation/:id
     */
    @Get(':uuid')
    findOne(@Param('uuid') uuid: string) {
      return this.VariationService.viewVariation(uuid);
    }
  
    /**
     * we have used patch decorator with id param to get id from request
     * so the API URL will be
     * PATCH http://localhost:3000/Variation/:id
     */
    @Patch(':uuid')
    update(@Param('uuid') uuid: string, @Body() updateVariationDto: UpdateVariationDto) {
      return this.VariationService.updateVariation(uuid, updateVariationDto);
    }
  
    /**
     * we have used Delete decorator with id param to get id from request
     * so the API URL will be
     * DELETE http://localhost:3000/Variation/:id
     */
    @Delete(':uuid')
    remove(@Param('uuid') uuid: string) {
      return this.VariationService.removeVariation(uuid);
    }
  }