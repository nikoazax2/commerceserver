import { Column, Entity, PrimaryGeneratedColumn, ManyToOne, JoinColumn, OneToOne, OneToMany } from 'typeorm';

@Entity()
export class Cart {
    @PrimaryGeneratedColumn("uuid")
    uuid: string;

    @Column({ type: 'varchar' })
    user: string;

    @Column({ type: 'json' })
    product: JSON;

    @Column({ type: 'smallint' })
    quantity: number;

    @Column({ type: 'varchar', length: 400 })
    details: string;

    @Column({ type: 'varchar', nullable: true })
    @JoinColumn()
    commandeuuid: string;
} 