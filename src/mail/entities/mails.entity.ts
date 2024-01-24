import { Column, Entity, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm'; 
import { IsOptional } from 'class-validator';

@Entity()
export class Mail {
    @PrimaryGeneratedColumn('uuid')
    uuid: string;
} 