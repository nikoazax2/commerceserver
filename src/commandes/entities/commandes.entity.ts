import { Column, Entity, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Product } from '../../products/entities/products.entity';
import { IsOptional } from 'class-validator';

@Entity()
export class Commande {

    @PrimaryGeneratedColumn("uuid")
    uuid: string;

    @Column({ type: 'date' })
    date: Date;

    @Column({ type: 'varchar' })
    useruuid: string;

    @Column({ type: 'varchar',nullable: true })
    @IsOptional()
    etat: string;

    @Column({
        type: 'text', array: true, nullable: true, default: []
    })
    @IsOptional()
    products: string[];
}

export { Product };

