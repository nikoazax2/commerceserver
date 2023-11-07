 
export class CreateCartDto {
    user: string;
    product: string;
    details: string;
    quantity: number = 1;
}