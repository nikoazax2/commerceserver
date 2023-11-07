import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Categorie {
    /**
     * this decorator will help to auto generate id for the table.
     */
    @PrimaryGeneratedColumn("uuid")
    uuid: string;

    @Column({ type: 'varchar', length: 30 })
    name: string;

} 