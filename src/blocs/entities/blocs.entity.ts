import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import { IsOptional } from 'class-validator';

@Entity()
export class Bloc { 
    @PrimaryGeneratedColumn('uuid')
    uuid: string;

    @Column({ type: 'int', nullable: true })
    type: number;

    @Column({ type: 'varchar', length: 30 })
    name: string;

    @Column({ type: 'varchar', length: 500, nullable: true })
    description: string;

    @Column({ type: 'varchar', length: 500, nullable: true })
    logo: string;

}
