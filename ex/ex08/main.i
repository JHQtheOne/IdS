# 1 "main.c"
# 1 "<command-line>"
# 1 "main.c"

const int lower = 12;

int sum = 0;

int main(void) {
        int i;
        for(i = lower; i < 15; i++) {
                sum += i;
        }
        return sum;
}
