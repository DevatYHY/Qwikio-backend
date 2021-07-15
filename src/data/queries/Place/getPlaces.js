import PlaceData from "../../types/GetRentType";
import { Place } from "../../models";

const getPlaces = {
    type: PlaceData,

    async resolve({ request }) {
        try {
            const records = await Place.findAll();
         
            return {
                results: records,
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

export default getPlaces;
