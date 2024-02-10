import { Column, Entity, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Product } from '../../products/entities/products.entity';
import { IsOptional } from 'class-validator';

@Entity()
export class Commande {
    @PrimaryGeneratedColumn("uuid")
    uuid: string;

    @Column({ type: 'varchar' })
    stripeid: string;

    @Column({ type: 'json' })
    shippingAddress: JSON;


    @Column({ type: 'json', nullable: true})
    products: JSON;

    @Column({ type: 'date' })
    date: Date;

    @Column({ type: 'varchar' })
    useruuid: string;


    @Column({ type: 'int', nullable: false })
    @IsOptional()
    etat: number; 


}

export { Product };

