import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
  } from '@nestjs/common';
  import { UsersService } from './users.service';
  import { CreateUserDto } from './dto/create-user.dto';
  import { UpdateUserDto } from './dto/update-user.dto';
  
  /**
   * whatever the string pass in controller decorator it will be appended to
   * API URL. to call any API from this controller you need to add prefix which is
   * passed in controller decorator.
   * in our case our base URL is http://localhost:3000/user
   */
  @Controller('user')
  export class UserController {
    constructor(private readonly UsersService: UsersService) {}
  
    /**
     * Post decorator represents method of request as we have used post decorator the method
     * of this API will be post.
     * so the API URL to create User will be
     * POST http://localhost:3000/user
     */
    @Post()
    create(@Body() createUserDto: CreateUserDto) {
      return this.UsersService.createUser(createUserDto);
    }
  
    /**
     * we have used get decorator to get all the user's list
     * so the API URL will be
     * GET http://localhost:3000/user
     */
    @Get()
    findAll() {
      return this.UsersService.findAllUser();
    }
  
    /**
     * we have used get decorator with id param to get id from request
     * so the API URL will be
     * GET http://localhost:3000/user/:id
     */
    @Get(':uuid')
    findOne(@Param('uuid') uuid: string) {
      return this.UsersService.viewUser(uuid);
    }
  
    /**
     * we have used patch decorator with id param to get id from request
     * so the API URL will be
     * PATCH http://localhost:3000/user/:id
     */
    @Patch(':uuid')
    update(@Param('uuid') uuid: string, @Body() updateUserDto: UpdateUserDto) {
      return this.UsersService.updateUser(uuid, updateUserDto);
    }
  
    /**
     * we have used Delete decorator with id param to get id from request
     * so the API URL will be
     * DELETE http://localhost:3000/user/:id
     */
    @Delete(':uuid')
    remove(@Param('uuid') uuid: string) {
      return this.UsersService.removeUser(uuid);
    }
  }