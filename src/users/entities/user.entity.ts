import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class User {
    /**
     * this decorator will help to auto generate id for the table.
     */
    @PrimaryGeneratedColumn("uuid")
    uuid: string;

    @Column({ type: 'varchar', length: 30 })
    username: string;

    @Column({ type: 'smallint' })
    role: number;

    @Column({ type: 'varchar', length: 40 })
    adress: string;

    @Column({ type: 'varchar', length: 40 })
    email: string;

    @Column({ type: 'varchar', length: 6, nullable: true })
    code: string;

    @Column({ type: 'boolean', default: false })
    activated: boolean;

    @Column({ type: 'varchar' })
    password: string;
} 