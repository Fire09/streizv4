

declare namespace NPX {
    class Events {
        static addHook(name: string, cb: (...args: any) => any): void;
        static start(): Promise<void>;
    }

    class Procedures {
        static register(name: string, cb: (src: number, ...args: any) => any): void;
        static execute(name: string, ...args: any): any;
    }
}

declare class SQL {
    static execute(query: string, ...args: any): any;
}