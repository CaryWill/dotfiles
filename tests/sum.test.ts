// @ts-nocheck
import { sum } from "./util";

describe("sum module", () => {
  test("adds 1 + 2 to equal 3", () => {
    expect(sum(1, 2)).toBe(3);
  });
});

describe("sum module2", () => {
  test("adds 1 + 2 to equal 3", () => {
    expect(sum(1, 2)).toBe(3);
    expect(sum(1, 2)).toBe(3);
  });
});
