import {
    IsInt,
    IsNotEmpty,
    IsNumber,
    IsOptional,
    IsString,
    MinLength,
} from 'class-validator';

export class CreateVariationDto {

    @IsString()
    productuuid: string;
    
    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    @IsNotEmpty()
    name: string;

    @IsInt()
    stock: number;

    @IsInt()
    order: number;
}