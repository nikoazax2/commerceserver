import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Product {
    /**
     * this decorator will help to auto generate id for the table.
     */
    @PrimaryGeneratedColumn("uuid")
    uuid: string;



    @Column({ type: 'int' })
    prix: number;


    @Column({ type: 'varchar', length: 30 })
    name: string;

} 