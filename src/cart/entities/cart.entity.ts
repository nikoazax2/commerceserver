import { Column, Entity, PrimaryGeneratedColumn, ManyToOne, JoinColumn, OneToOne, OneToMany } from 'typeorm';

@Entity()
export class Cart {
    @PrimaryGeneratedColumn("uuid")
    uuid: string;

    @Column({ type: 'varchar', length: 30 })
    user: string;

    @Column({ type: 'varchar', length: 30 })
    product: string;

    @Column({ type: 'smallint' })
    quantity: number;

    @Column({ type: 'varchar', length: 400 })
    details: string;
} 