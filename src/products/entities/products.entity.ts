import { Column, Entity, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from 'typeorm';
import { Categorie } from '../../categories/entities/categories.entity';

@Entity()
export class Product {
    @Column({ type: 'uuid' })
    categorieuuid: string;

    @PrimaryGeneratedColumn("uuid")
    uuid: string;

    @Column({ type: 'float' })
    prix: number;

    @Column({ type: 'varchar', length: 30 })
    name: string;

    @Column({ type: 'varchar', length: 100000 })
    description: string;

    @Column({
        type: 'text', array: true, nullable: true, default: []
    })
    image: string[];
}

export { Categorie };

