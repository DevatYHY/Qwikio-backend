import GetVehilceStatusType from "../../types/GetVehilceStatusType";
import { VehicleStatus } from "../../models";

const getVechileStatus = {
    type: GetVehilceStatusType,

    async resolve({ request }) {
        try {
            const record = await VehicleStatus.findOne({
                where: {
                    id: 7
                },
            });

            return {
                result: record,
                status: 200,
            };
        } catch (error) {
            return {
                errorMessage: "Something went wrong" + error,
                status: 400,
            };
        }
    },
};

export default getVechileStatus;
