import {
    IsInt,
    IsNotEmpty,
    IsNumber,
    IsOptional,
    IsString,
    MinLength,
} from 'class-validator';

export class CreateCommandeDto {
    @IsNotEmpty()
    @IsString()
    @MinLength(4)
    readonly date: Date;

    @IsNotEmpty()
    @IsString()
    @MinLength(4)
    readonly useruuid: string;

    @IsOptional()
    @IsString({ each: true })
    readonly products: string[];

    @IsOptional()
    @IsString()
    readonly etat: string;
}