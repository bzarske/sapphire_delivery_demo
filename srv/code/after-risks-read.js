/**
 * This custom logic calculates the criticality of a risk based on its impact. If the impact is greater than 10000 dollars and it is the maximum impact among all risks, the criticality is set to 1; otherwise, it is set to 2.
 * @After(event = { "READ" }, entity = "riskManagementSrv.Risks")
 * @param {(Object|Object[])} results - For the After phase only: the results of the event processing
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(results, request) {
    const { Risks } = cds.entities;

    // Ensure results is an array for uniform processing
    if (!Array.isArray(results)) {
        results = [results];
    }

    // Fetch the maximum impact among all risks
    const maxImpactRisk = await SELECT.one.from(Risks).orderBy({ ref: ['impact'], sort: 'desc' });

    // Check if maxImpactRisk is defined
    const maxImpact = maxImpactRisk ? maxImpactRisk.impact : undefined;

    // Iterate over each result to set the criticality
    results.forEach(risk => {
        if (risk.impact > 10000 && risk.impact === maxImpact) {
            risk.criticality = 1;
        } else {
            risk.criticality = 2;
        }
    });
};
