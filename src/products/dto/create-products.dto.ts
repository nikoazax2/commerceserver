import {
    IsInt,
    IsNotEmpty,
    IsNumber,
    IsOptional,
    IsString,
    MinLength,
} from 'class-validator';

const passwordRegEx =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*d)(?=.*[@$!%*?&])[A-Za-zd@$!%*?&]{8,20}$/;

export class CreateProductDto {   
    @IsOptional()
    name: string;

    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    categorieuuid: string; 

    @IsNumber()
    prix: number;

    @IsOptional()
    description: string;

    @IsNotEmpty()
    image: string[];

    @IsOptional()
    idapistripe: string; 

    @IsOptional()
    ancienprixpromo: number;
}