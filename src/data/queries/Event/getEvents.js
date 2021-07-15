import EventData from "../../types/GetEventType";
import { Event } from "../../models";

const getEvents = {
    type: EventData,

    async resolve({ request }) {
        try {
            const records = await Event.findAll();
         
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

export default getEvents;
