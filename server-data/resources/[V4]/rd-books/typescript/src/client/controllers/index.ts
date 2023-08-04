

import { InitCopy } from "./copy";
import { InitEvents } from "./events";
import { InitWrite } from "./write";

export async function Init(): Promise<void> {
    await InitWrite();
    await InitCopy();
    await InitEvents();
}