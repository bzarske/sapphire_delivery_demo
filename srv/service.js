/**
 * Code is auto-generated by Application Logic, DO NOT EDIT.
 * @version(2.0)
 */
const LCAPApplicationService = require('@sap/low-code-event-handler');
const after_Risks_Read = require('./code/after-risks-read');

class riskManagementSrv extends LCAPApplicationService {
    async init() {

        this.after('READ', 'Risks', async (results, request) => {
            await after_Risks_Read(results, request);
        });

        return super.init();
    }
}


module.exports = {
    riskManagementSrv
};