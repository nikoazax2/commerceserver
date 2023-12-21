import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import { IsOptional } from 'class-validator';

@Entity()
export class Contenu {
    @PrimaryGeneratedColumn('uuid')
    uuid: string;

    @Column({ type: 'varchar', length: 30 })
    name: string;

    @Column({ type: 'varchar', length: 30 , nullable: true })
    valeur: string;

    @Column({ type: 'int', nullable: true })
    type: number;

    @Column({ type: 'varchar', length: 500, nullable: true })
    description: string;

    @Column({ type: 'varchar', length: 100000, nullable: true })
    contenu: string;

    @Column({ type: 'varchar', length: 30, nullable: true })
    page: string;

    @Column({ type: 'int', nullable: true })
    order: number;

    @Column({ type: 'boolean', nullable: true })
    photo: boolean;

    @Column({
        type: 'text', array: true, nullable: true, default: []
    })
    @IsOptional()
    image: string[];
}
