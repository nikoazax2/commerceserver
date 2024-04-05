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

    @IsNumber()
    @IsInt()
    @Optional()
    type: number;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    contenu: JSON;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    espacement: JSON;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    @Optional()
    page: string;

    @IsNumber()
    @IsInt()
    @Optional()
    order: number;

    @IsNumber()
    @IsInt()
    @Optional()
    orderHorizontal: number;

    @IsNotEmpty()
    removable: boolean;
}
