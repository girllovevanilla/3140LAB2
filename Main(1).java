public static void main(String[] args) {
        System.out.println("Please enter the date taking 2022-10-24 2022/10/24 10-24 10/24 as example");
        Scanner input = new Scanner(System.in);
        String date = input.next();
        int i = 0;
        date = date.replaceAll("/", "-");
        String[] split = date.split("-");

        if (split.length == 2) {
            date = LocalDate.now().getYear() + "-" + date;
            split  = date.split("-");
        }
        if (split.length != 3) {
            System.out.println("Input error,please re-enter");
            i = 1;
            main(args);
        }
        LocalDate currentDay = LocalDate.now();
        System.out.println(format(split, i));
        LocalDate dueDayOne = LocalDate.of(Integer.parseInt(split[0]), Integer.parseInt(split[1]), Integer.parseInt(split[2]));
        //Calculation year days
        int sum = calculation(Integer.parseInt(split[0]));
        if (currentDay.isAfter(dueDayOne) && sum == 0) {
            System.out.println(dueDayOne + "\tLate");
        } else {
            Period period = Period.between(currentDay, dueDayOne);
            System.out.println("You still have:" + period.getMonths() + "\tmonth\t" + (period.getDays() + calculation(Integer.parseInt(split[0]))) + "\tday");
        }
        System.out.println("-------over-------");
    }

    //Calculation year days
    public static int calculation(int year) {
        LocalDate now = LocalDate.now();
        int sum = 0;
        for (int i = now.getYear(); i < year; i++) {
            if (!(i % 4 == 0 && i % 100 != 0 || i % 400 == 0)) {
                sum += 366;
            } else {
                sum += 365;
            }
        }
        return sum;

    }

    //Prompt after formatting
    public static String format(String[] date, int i) {
        String msg = "";
        if (i == 0) {
            msg = "Lab 1 due\t" + date[0] + "-" + date[1] + "-" + date[2];
        } else {
            msg = "Lab 1 due\t" + date[0] + "/" + date[1] + "/" + date[2];
        }
        return msg;
    }