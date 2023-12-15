import { Column, Entity, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Categorie } from '../../categories/entities/categories.entity';
import { IsOptional } from 'class-validator';

@Entity()
export class Product {
    @Column({ type: 'uuid' })
    @IsOptional()
    categorieuuid: string;

    @PrimaryGeneratedColumn("uuid")
    uuid: string;

    @Column({ type: 'float', nullable: true })
    @IsOptional()
    prix: number;

    @Column({ type: 'varchar', length: 30, nullable: true })
    @IsOptional()
    name: string;

    @Column({ type: 'varchar', length: 100000, nullable: true })
    @IsOptional()
    description: string;

    @Column({
        type: 'text', array: true, nullable: true, default: []
    })
    @IsOptional()
    image: string[];

    @Column({ type: 'varchar', length: 100, nullable: true })
    @IsOptional()
    idapistripe: string;

    @Column({ type: 'float', nullable: true })
    @IsOptional()
    ancienprixpromo: number;
}

export { Categorie };

