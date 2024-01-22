import { PartialType } from '@nestjs/mapped-types';
import { CreateBlocDto } from './create-blocs.dto';

export class UpdateBlocDto extends PartialType(CreateBlocDto) { 
    
}
