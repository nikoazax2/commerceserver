import { Column, Entity, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Product } from '../../products/entities/products.entity';

@Entity()
export class Variation {
    
    @PrimaryGeneratedColumn("uuid")
    uuid: string;
    
    @Column({ type: 'uuid' })
    productuuid: string;

    @Column({ type: 'int' })
    stock: number;

    @Column({ type: 'varchar', length: 30 })
    name: string;

    @Column({ type: 'int' })
    order: number;
}

export { Product };

