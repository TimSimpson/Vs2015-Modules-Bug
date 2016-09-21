module ModC;

// The goal here is to see if the name ModA matters.
import ModB;

export namespace fruit {

    // Adapts Orange to Banana interface
    class Banana
    {
    public:
        Banana(int c)
        :   o(c)
        {
        }

        int count() const {
            return o.count();
        }

        void count(int c) {
            o.count(c);
        }

    private:
        ::fruit::Orange o;

        // Strangely enough, module C can use "Apple" from module A
        // perfectly.
        //::fruit::Apple a;
    };

    int begin(const Banana & banana) {
        return 0;
    }

    int end(const Banana & banana) {
        return banana.count();
    }

}
