import { Optional } from '@nestjs/common';
import {
    IsInt,
    IsNotEmpty,
    IsNumber,
    IsString,
    MinLength,
} from 'class-validator';

export class CreateContenuDto {
    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    @IsNotEmpty()
    name: string;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    @Optional()
    description: string;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    @Optional()
    valeur: string;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    contenu: string;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    @Optional()
    page: string;

    @IsNumber()
    @IsInt()
    @Optional()
    order: number;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    @Optional()
    photo: boolean;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    @Optional()
    image: string[];



}
