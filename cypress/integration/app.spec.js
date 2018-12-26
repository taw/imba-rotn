context("ROT-N App", () => {
  beforeEach(() => {
    cy.visit("http://localhost:8080/")
  })

  it("automatically rot-Ns whatever you put in the textbox", () => {
    cy.get("textarea")
      .clear()
      .type("All your 10 bases are belong to us!")
    cy.get(".rot-8 td")
      .should("contain", "Itt gwcz 10 jiama izm jmtwvo bw ca!")
  })
})
