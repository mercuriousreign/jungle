it("There is products on the page",()=> {
  cy.visit('/')
  cy.get(".products article").should("be.visible");
});

it("User can add to cart", () => {
  
  cy.get('.nav-link').contains('My Cart (0)')
  cy.get(':nth-child(1) > a > img').click()
  cy.wait(600)
  cy.get('.btn').contains("Add")
  cy.contains("Add").click()
  cy.get('.nav-link').contains('My Cart (1)')
});