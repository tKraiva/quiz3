export function DifferenceInDays(firstDateString, secondDateString) {
    firstDateString = firstDateString || new Date();
    const firstDate = Date.parse(firstDateString);
    const secondDate = Date.parse(secondDateString)
    return Math.round((secondDate-firstDate)/(1000*60*60*24));
  }