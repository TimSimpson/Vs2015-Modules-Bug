module ModB;

import ModA;

export namespace fruit {

    // Adapts Apple to Orange interface
    class Orange
    {
    public:
        Orange(int c)
        :   a(c)
        {
        }

        int count() const {
            return a.count();
        }

        void count(int c) {
            a.count(c);
        }

    private:
        ::fruit::Apple a;
    };

    int begin(const Orange & orange) {
        return 0;
    }

    int end(const Orange & orange) {
        return orange.count();
    }

}
