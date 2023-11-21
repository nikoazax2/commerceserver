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

    @Column({ type: 'varchar', length: 1000 })
    description: string;

    @Column({ type: 'text', nullable: true }) // Store image as a text (base64)
    image: string | null;
}

export { Categorie };

