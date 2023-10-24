import { 
    IsInt,
    IsNotEmpty,
    IsNumber,
    IsString, 
    MinLength,
} from 'class-validator';

const passwordRegEx =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*d)(?=.*[@$!%*?&])[A-Za-zd@$!%*?&]{8,20}$/;

export class CreateProductDto {
    @IsString()
    @MinLength(2, { message: 'Name must have atleast 2 characters.' })
    @IsNotEmpty()
    name: string;

    @IsNumber()
    prix: number;

    @IsNotEmpty()
    image: string;

}