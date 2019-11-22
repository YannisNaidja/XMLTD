export interface Product {
    code: string;
    name: string;
    price: number;
    brand: string;
    productType: string;
    extras: object;

    getExtras();
}
