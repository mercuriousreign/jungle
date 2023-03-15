it("There is products on the page",()=> {
  cy.visit('/')
  cy.get(".products article").should("be.visible");
});

it("There is 2 products on the page", () => {
  cy.get(':nth-child(1) > a > img').click()
  cy.get('.btn').contains("Add")
});