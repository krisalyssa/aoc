(ns day-02-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-02 :refer [part1 part2]]))

(deftest day-02-test
  (testing "sample data"
    (is (= 0 (part1 "../data/02-sample.txt")))
    (is (= 0 (part2 "../data/02-sample.txt")))))
